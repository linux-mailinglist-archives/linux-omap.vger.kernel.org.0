Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FDE43E2A67
	for <lists+linux-omap@lfdr.de>; Fri,  6 Aug 2021 14:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343615AbhHFMOv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Aug 2021 08:14:51 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:51750 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343589AbhHFMOu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Aug 2021 08:14:50 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1mBykB-0003gR-3f; Fri, 06 Aug 2021 20:14:31 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1mByk6-0006eb-FL; Fri, 06 Aug 2021 20:14:26 +0800
Date:   Fri, 6 Aug 2021 20:14:26 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tony Lindgren <tony@atomide.com>
Cc:     "David S . Miller" <davem@davemloft.net>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-crypto@vger.kernel.org, Lokesh Vutla <lokeshvutla@ti.com>,
        Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH 1/6] crypto: omap-sham - clear dma flags only after
 omap_sham_update_dma_stop()
Message-ID: <20210806121426.GA25554@gondor.apana.org.au>
References: <20210727102339.49141-1-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727102339.49141-1-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jul 27, 2021 at 01:23:34PM +0300, Tony Lindgren wrote:
> We should not clear FLAGS_DMA_ACTIVE before omap_sham_update_dma_stop() is
> done calling dma_unmap_sg(). We already clear FLAGS_DMA_ACTIVE at the
> end of omap_sham_update_dma_stop().
> 
> The early clearing of FLAGS_DMA_ACTIVE is not causing issues as we do not
> need to defer anything based on FLAGS_DMA_ACTIVE currently. So this can be
> applied as clean-up.
> 
> Cc: Lokesh Vutla <lokeshvutla@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/crypto/omap-sham.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
