Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3C93F3961
	for <lists+linux-omap@lfdr.de>; Sat, 21 Aug 2021 09:49:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbhHUHuV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 21 Aug 2021 03:50:21 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:53804 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232469AbhHUHuU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 21 Aug 2021 03:50:20 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1mHLl4-0006DZ-DM; Sat, 21 Aug 2021 15:49:38 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1mHLky-0000tJ-VC; Sat, 21 Aug 2021 15:49:32 +0800
Date:   Sat, 21 Aug 2021 15:49:32 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Ben Hutchings <ben.hutchings@mind.be>
Cc:     "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-omap@vger.kernel.org,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH 0/2] omap-crypto fixes
Message-ID: <20210821074932.GA3392@gondor.apana.org.au>
References: <20210811000333.GA22095@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210811000333.GA22095@cephalopod>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Aug 11, 2021 at 02:03:33AM +0200, Ben Hutchings wrote:
> These are two non-urgent fixes for the omap-crypto drivers.
> 
> Ben.
> 
> Ben Hutchings (2):
>   crypto: omap - Avoid redundant copy when using truncated sg list
>   crypto: omap - Fix inconsistent locking of device lists
> 
>  drivers/crypto/omap-aes.c    |  8 ++++----
>  drivers/crypto/omap-crypto.c |  2 +-
>  drivers/crypto/omap-des.c    |  8 ++++----
>  drivers/crypto/omap-sham.c   | 12 ++++++------
>  4 files changed, 15 insertions(+), 15 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
