Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F06DA6E9BE
	for <lists+linux-omap@lfdr.de>; Fri, 19 Jul 2019 19:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731851AbfGSRCV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Jul 2019 13:02:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:58234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728476AbfGSRCV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 19 Jul 2019 13:02:21 -0400
Received: from localhost (unknown [84.241.199.95])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 825C12184E;
        Fri, 19 Jul 2019 17:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563555740;
        bh=mc9dpku4ZlCQzY0VURDm7LZ8gZlKE0j++u2PjTJ3XdM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OW4hvB/DoSAgfh3FWmT4AWO+a7FQdlt3aM00yFr9oP8qSAOzd3w7U5lc3JHGO0mlD
         /XpP4yAmtEhIIugEoVZ014rhWASJywD3fnNthzH8n+t8hHsG2V97sX+qrmaZq60zjK
         uFs3Q+fcX+VG0Q769/eDIvnWXP4oFaAtbg6a5YHw=
Date:   Fri, 19 Jul 2019 19:27:48 +0900
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Machek <pavel@denx.de>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-omap@vger.kernel.org, tony@atomide.com, sre@kernel.org,
        nekit1000@gmail.com, mpartap@gmx.net, merlijn@wizzup.org,
        johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: USB Modem support for Droid 4
Message-ID: <20190719102748.GA14546@kroah.com>
References: <20190718201713.GA25103@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718201713.GA25103@amd>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Jul 18, 2019 at 10:17:13PM +0200, Pavel Machek wrote:
> From: Tony Lindgren <tony@atomide.com>
> 
> Droid starts to have useful support in linux-next. Modem is tricky to
> play with, but this is enough to get basic support.
> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>

No signed-off-by from Tony?

And no [PATCH] in the subject?

odd...

