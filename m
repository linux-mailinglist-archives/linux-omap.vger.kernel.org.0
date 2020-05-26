Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4F191E22B5
	for <lists+linux-omap@lfdr.de>; Tue, 26 May 2020 15:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728467AbgEZNHw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 09:07:52 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:55640 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728061AbgEZNHw (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 May 2020 09:07:52 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jdZJ1-0006to-Jj; Tue, 26 May 2020 23:07:44 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Tue, 26 May 2020 23:07:43 +1000
Date:   Tue, 26 May 2020 23:07:43 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     davem@davemloft.net, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCHv2 3/7] crypto: omap-crypto: fix userspace copied buffer
 access
Message-ID: <20200526130743.GA13801@gondor.apana.org.au>
References: <20200511111913.26541-1-t-kristo@ti.com>
 <20200511111913.26541-4-t-kristo@ti.com>
 <20200522131247.GA27255@gondor.apana.org.au>
 <24092385-1348-f55d-a637-6fb2b3129f4e@ti.com>
 <20200526123552.GA10897@gondor.apana.org.au>
 <7fece128-ea82-06cb-23d3-d49c9f10c4a0@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7fece128-ea82-06cb-23d3-d49c9f10c4a0@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 26, 2020 at 03:57:10PM +0300, Tero Kristo wrote:
>
> Btw, any word on the TI sa2ul series I posted a while back? I see it has
> been marked as deferred in patchwork but I am not quite sure what that
> means... deferred until what? I have also been thinking of creating a
> drivers/crypto/ti subdir at some point, as there are quite a few files for
> TI accelerators already.

IIRC it was missing an ack from Rob Herring, unless you want me to
only apply the bits under drivers/crypto?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
