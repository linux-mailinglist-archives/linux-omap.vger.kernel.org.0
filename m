Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E499842E143
	for <lists+linux-omap@lfdr.de>; Thu, 14 Oct 2021 20:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhJNScW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 14 Oct 2021 14:32:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:51908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230096AbhJNScV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 14 Oct 2021 14:32:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 106F96105A;
        Thu, 14 Oct 2021 18:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634236216;
        bh=6gIn29naRubCw68Wmg4GZTgHDg0wmSy/Pag5o9tr39g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=D3sJjcPESpvNw3pzI5995YjE4YyGKdRvKkW1f2goKA/21IFe5ETF1JKv5GI0UB0GB
         Q2sggq3e088MWTB+eRC/avRgdUwpbAcO4XCrL6semcv1y6EDnY/LQWQrAHpYhxciBU
         HhDxg357l/AEQTOXNgSKdYlDux6ghMBOWfBfVGmteaenGLdLXm1pqJ6HpnKK2YAppr
         qi7B2FNLytiXNahEcy8g49dcIaIXzCJiyVQUdNaIrh0NgoJ+8SSSUiK/+YBajPHlUH
         t5pW6Qp13y4jZthDdqHMlEqnVUpn3jGmhSL4Wb0YKBBwEXgENgy7FrYjS0E8n27O0m
         TB3a7WzkJerNA==
Date:   Thu, 14 Oct 2021 13:34:41 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Cc: linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, ;
Illegal-Object: Syntax error in Cc: address found on vger.kernel.org:
        Cc:     ;
                        ^-missing semicolon to end mail group, extraneous tokens in mailbox, missing end of mailbox
Subject: Re: [PATCH] video: omapfb: Fix fall-through warning for Clang
Message-ID: <20211014183441.GA1146820@embeddedor>
References: <20211014165320.GA1145571@embeddedor>
 <YWh2bKnY0Z75g0S3@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWh2bKnY0Z75g0S3@ravnborg.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 14, 2021 at 08:26:52PM +0200, Sam Ravnborg wrote:
> Hi Gustavo,
> On Thu, Oct 14, 2021 at 11:53:20AM -0500, Gustavo A. R. Silva wrote:
> > Fix the following fallthrough warnings:
> > 
> > drivers/video/fbdev/omap/omapfb_main.c:1558:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
> >            case 0:
> >            ^
> >    drivers/video/fbdev/omap/omapfb_main.c:1558:2: note: insert 'break;' to avoid fall-through
> >            case 0:
> >            ^
> >            break;
> >    1 warning generated.
> > 
> > This helps with the ongoing efforts to globally enable
> > -Wimplicit-fallthrough for Clang.
> > 
> > Link: https://github.com/KSPP/linux/issues/115
> > Link: https://lore.kernel.org/lkml/202110141005.hUjaYMEi-lkp@intel.com/
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> applied to drm-misc-next. It will show up in -next in 1-2 weeks time.

Great. :)

Thanks, Sam.
--
Gustavo
