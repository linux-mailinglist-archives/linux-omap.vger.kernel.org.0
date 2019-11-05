Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20A27F0437
	for <lists+linux-omap@lfdr.de>; Tue,  5 Nov 2019 18:42:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390435AbfKERmC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Nov 2019 12:42:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:60916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388969AbfKERmC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 Nov 2019 12:42:02 -0500
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84CE9214D8;
        Tue,  5 Nov 2019 17:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572975721;
        bh=wpN5dFK9y7CHh7qhkGjKOJbrRTRGtSpcxKUvYH3cpdM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UDKQjMTqFTL1AZCg5U4sHPerBG12YJ8qDC+VWkfCSUVMh2tGMk3XNEe7Z8hChxM1v
         jzI7+CbehGyLJPsR1DnBj/2FohcSXmH9eu1gOIJ8k9oBYklbyn8RrpIuOwNy1uOZXW
         JSwA0hdZJrEmrzKr7VVE7UEOTayZvfNe6B2Ejlw4=
Date:   Tue, 5 Nov 2019 09:42:00 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     herbert@gondor.apana.org.au, davem@davemloft.net,
        linux-crypto@vger.kernel.org, ard.biesheuvel@linaro.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/10] crypto: add timeout to crypto_wait_req
Message-ID: <20191105174200.GC757@sol.localdomain>
Mail-Followup-To: Tero Kristo <t-kristo@ti.com>,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        linux-crypto@vger.kernel.org, ard.biesheuvel@linaro.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20191017122549.4634-1-t-kristo@ti.com>
 <20191017122549.4634-10-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191017122549.4634-10-t-kristo@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 17, 2019 at 03:25:48PM +0300, Tero Kristo wrote:
> Currently crypto_wait_req waits indefinitely for an async crypto request
> to complete. This is bad as it can cause for example the crypto test
> manager to hang without any notification as to why it has happened.
> Instead of waiting indefinitely, add a 1 second timeout to the call,
> and provide a warning print if a timeout happens.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
>  include/linux/crypto.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/crypto.h b/include/linux/crypto.h
> index 19ea3a371d7b..b8f0e5c3cc0c 100644
> --- a/include/linux/crypto.h
> +++ b/include/linux/crypto.h
> @@ -682,8 +682,15 @@ static inline int crypto_wait_req(int err, struct crypto_wait *wait)
>  	switch (err) {
>  	case -EINPROGRESS:
>  	case -EBUSY:
> -		wait_for_completion(&wait->completion);
> +		err = wait_for_completion_timeout(&wait->completion,
> +						  msecs_to_jiffies(1000));
>  		reinit_completion(&wait->completion);
> +		if (!err) {
> +			pr_err("%s: timeout for %p\n", __func__, wait);
> +			err = -ETIMEDOUT;
> +			break;
> +		}
> +
>  		err = wait->err;
>  		break;
>  	};

I'm not sure this is a good idea, because operations could legitimately take a
long time, e.g. if someone passes in a huge data buffer.  How do you know that X
amount of time is always going to be enough?

- Eric
