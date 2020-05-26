Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE5241E2202
	for <lists+linux-omap@lfdr.de>; Tue, 26 May 2020 14:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389139AbgEZMgC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 08:36:02 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:55602 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389076AbgEZMgC (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 May 2020 08:36:02 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jdYoC-0006OH-ND; Tue, 26 May 2020 22:35:53 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Tue, 26 May 2020 22:35:52 +1000
Date:   Tue, 26 May 2020 22:35:52 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     davem@davemloft.net, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCHv2 3/7] crypto: omap-crypto: fix userspace copied buffer
 access
Message-ID: <20200526123552.GA10897@gondor.apana.org.au>
References: <20200511111913.26541-1-t-kristo@ti.com>
 <20200511111913.26541-4-t-kristo@ti.com>
 <20200522131247.GA27255@gondor.apana.org.au>
 <24092385-1348-f55d-a637-6fb2b3129f4e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24092385-1348-f55d-a637-6fb2b3129f4e@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 26, 2020 at 03:27:38PM +0300, Tero Kristo wrote:
>
> I think it would make sense to use that, however as I am just fixing an
> existing bug here, would it be ok if I just fix your above comment and post
> v3? I can convert this later to sg_miter and take a shot at moving this to
> lib/scatterlist.c as that seems slightly bigger effort and I would not want
> to block this whole series because of that...

Of course.  A minimal fix would be just fine.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
