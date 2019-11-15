Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC8A8FD874
	for <lists+linux-omap@lfdr.de>; Fri, 15 Nov 2019 10:10:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726717AbfKOJKK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 15 Nov 2019 04:10:10 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:39112 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfKOJKK (ORCPT <rfc822;linux-omap@vger.kernel.orG>);
        Fri, 15 Nov 2019 04:10:10 -0500
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1iVXcF-0007up-Vq; Fri, 15 Nov 2019 17:10:08 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1iVXcF-0006I4-37; Fri, 15 Nov 2019 17:10:07 +0800
Date:   Fri, 15 Nov 2019 17:10:07 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     davem@davemloft.net, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org, ard.biesheuvel@kernel.org,
        Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCHv2 09/22] crypto: add timeout to crypto_wait_req
Message-ID: <20191115091007.r6qshw3m5v7bz2uk@gondor.apana.org.au>
References: <20191105140111.20285-1-t-kristo@ti.com>
 <20191105140111.20285-10-t-kristo@ti.com>
 <20191115052918.htafn2sch3a6aizv@gondor.apana.org.au>
 <28db6fc9-fa0d-0914-f0e9-9cba53ac16ad@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28db6fc9-fa0d-0914-f0e9-9cba53ac16ad@ti.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Nov 15, 2019 at 09:44:51AM +0200, Tero Kristo wrote:
>
> Yep, its fine to ditch this one as it was provided as just a nice to have
> initially anyway. Any comments for the rest of the series?

The rest of them are fine.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
