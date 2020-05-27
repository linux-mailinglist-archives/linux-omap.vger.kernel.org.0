Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 280271E3576
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 04:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726064AbgE0CUH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 22:20:07 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:57830 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbgE0CUH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 May 2020 22:20:07 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jdlfk-0000q5-5C; Wed, 27 May 2020 12:20:01 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Wed, 27 May 2020 12:20:00 +1000
Date:   Wed, 27 May 2020 12:20:00 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     davem@davemloft.net, linux-crypto@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCHv3 3/7] crypto: omap-crypto: fix userspace copied buffer
 access
Message-ID: <20200527022000.GB27873@gondor.apana.org.au>
References: <20200522131247.GA27255@gondor.apana.org.au>
 <20200526142104.7362-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200526142104.7362-1-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, May 26, 2020 at 05:21:04PM +0300, Tero Kristo wrote:
> In case buffers are copied from userspace, directly accessing the page
> will most likely fail because it hasn't been mapped into the kernel
> memory space. Fix the issue by forcing a kmap / kunmap within the
> cleanup functionality.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> ---
> v3:
>   - Added PageSlab() check to the cache flushing portion, and changed
>     the used flush API to be flush_kernel_dcache_page()
> 
>  drivers/crypto/omap-crypto.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Please resubmit the whole series.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
