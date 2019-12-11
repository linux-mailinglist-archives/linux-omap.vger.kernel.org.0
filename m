Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5796A11A7AD
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2019 10:42:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbfLKJm4 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 11 Dec 2019 04:42:56 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:54656 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728480AbfLKJm4 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 11 Dec 2019 04:42:56 -0500
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1ieyWC-0000Le-UT; Wed, 11 Dec 2019 17:42:53 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1ieyWB-0000eR-Dp; Wed, 11 Dec 2019 17:42:51 +0800
Date:   Wed, 11 Dec 2019 17:42:51 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     davem@davemloft.net, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org, ard.biesheuvel@kernel.org
Subject: Re: [PATCHv2 00/22] crypto: omap-sham: fixes towards 5.5
Message-ID: <20191211094251.ojyrt4hgiao7gnmy@gondor.apana.org.au>
References: <20191105140111.20285-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191105140111.20285-1-t-kristo@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 05, 2019 at 04:00:49PM +0200, Tero Kristo wrote:
> Hi,
> 
> This series applies on top of the skcipher API conversion patch from Ard
> Biesheuvel [1].
> 
> Fixes any known OMAP crypto issues with the crypto manager test suite,
> including the extra tests. Tested via ipsec, tcrypt and with an
> rmmod/modprobe loop while the extra tests for crypto manager are enabled.
> 
> Couple of additional bug fixes are also done, like proper cleanup of the
> sysfs entries, and huge data handling for SHA.
> 
> Please note patch #9 is not related to omap-crypto, just a nice to have
> tweak for testing purposes. I find it quite annoying myself that if
> the HW engine is broken for some reason and hangs, the crypto manager
> test suite does not throw any failure for that but just hangs itself
> also.
> 
> -Tero
> 
> [1] https://patchwork.kernel.org/patch/11188595/

All applied except for patch 9.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
