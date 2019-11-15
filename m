Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD28FD441
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2019 06:29:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbfKOF30 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Nov 2019 00:29:26 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:54458 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725848AbfKOF30 (ORCPT <rfc822;linux-omap@vger.kernel.orG>);
        Fri, 15 Nov 2019 00:29:26 -0500
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1iVUAb-0003lE-MP; Fri, 15 Nov 2019 13:29:21 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1iVUAY-0006A4-ML; Fri, 15 Nov 2019 13:29:18 +0800
Date:   Fri, 15 Nov 2019 13:29:18 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     davem@davemloft.net, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org, ard.biesheuvel@kernel.org,
        Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCHv2 09/22] crypto: add timeout to crypto_wait_req
Message-ID: <20191115052918.htafn2sch3a6aizv@gondor.apana.org.au>
References: <20191105140111.20285-1-t-kristo@ti.com>
 <20191105140111.20285-10-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105140111.20285-10-t-kristo@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 05, 2019 at 04:00:58PM +0200, Tero Kristo wrote:
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

As we discussed before this patch is not acceptable because it
would cause a use-after-free.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
