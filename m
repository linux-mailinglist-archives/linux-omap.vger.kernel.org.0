Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39AF1453589
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 16:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237922AbhKPPVC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 10:21:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:38746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237778AbhKPPVB (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Nov 2021 10:21:01 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3636761BF9;
        Tue, 16 Nov 2021 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637075884;
        bh=u9SX2DemwNFaZqmFy59yqo9oEg0cChgWWEB6OGLB9B8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=suJJZDR37V7bf1Km41/8+po9hiQyBQu6v8pz7aiayZKgaP4YGrH6GwX8QmljT3IJs
         t7zEBsESPRI8iYKvRHbFCAFhBIRcW5UMKRsAgoNGP2DsB9RqYztqx0IMnR5k+1b+C+
         b7lB3HwqJ4CM3vUstnx9ibvx8a7YSloLbtWnAVTsIcQmnMrfdZ5plrzflInS1UmWr4
         yIBBEJwHZBSRrLw4LU6JPpt474HOcwFgtEJnkZjnXclzFXkAsE0z1ZmspLFIRPT36S
         GGJb/sL5J3OZdconz+Y5OZXdbIq8x0p+R/kIZ9SEFdA2AWhIICo0hkP8kBEuLcaTCE
         tzQq2wXYKsUbA==
Date:   Tue, 16 Nov 2021 08:17:59 -0700
From:   Nathan Chancellor <nathan@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] omapfb: add one more "fallthrough" statement
Message-ID: <YZPLpxGXVyaaKZsm@archlinux-ax161>
References: <20211116092204.4116587-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211116092204.4116587-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Nov 16, 2021 at 10:21:54AM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> clang warns about one missing fallthrough that gcc ignores:
> 
> drivers/video/fbdev/omap/omapfb_main.c:1558:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
> 
> Add it here as well.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/video/fbdev/omap/omapfb_main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/fbdev/omap/omapfb_main.c b/drivers/video/fbdev/omap/omapfb_main.c
> index 3d090d2d9ed9..a6a8404d1462 100644
> --- a/drivers/video/fbdev/omap/omapfb_main.c
> +++ b/drivers/video/fbdev/omap/omapfb_main.c
> @@ -1555,6 +1555,7 @@ static void omapfb_free_resources(struct omapfb_device *fbdev, int state)
>  	case 1:
>  		dev_set_drvdata(fbdev->dev, NULL);
>  		kfree(fbdev);
> +		fallthrough;
>  	case 0:
>  		/* nothing to free */
>  		break;
> -- 
> 2.29.2
> 
