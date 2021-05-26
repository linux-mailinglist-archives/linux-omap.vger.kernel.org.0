Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A4A3915AD
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 13:03:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233997AbhEZLFR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 07:05:17 -0400
Received: from muru.com ([72.249.23.125]:60638 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233944AbhEZLFQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 May 2021 07:05:16 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 503E180AE;
        Wed, 26 May 2021 11:03:50 +0000 (UTC)
Date:   Wed, 26 May 2021 14:03:41 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     aaro.koskinen@iki.fi, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: OMAP1: ams-delta: remove unused function
 ams_delta_camera_power
Message-ID: <YK4rDeJSS9rEAF0W@atomide.com>
References: <20210401160434.7655-1-maciej.falkowski9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401160434.7655-1-maciej.falkowski9@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Maciej Falkowski <maciej.falkowski9@gmail.com> [210401 19:06]:
> The ams_delta_camera_power() function is unused as reports
> Clang compilation with omap1_defconfig on linux-next:
> 
> arch/arm/mach-omap1/board-ams-delta.c:462:12: warning: unused function 'ams_delta_camera_power' [-Wunused-function]
> static int ams_delta_camera_power(struct device *dev, int power)
>            ^
> 1 warning generated.
> 
> The soc_camera support was dropped without removing
> ams_delta_camera_power() function, making it unused.
> 
> Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
> Fixes: ce548396a433 ("media: mach-omap1: board-ams-delta.c: remove soc_camera dependencies")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1326

Thanks applying into fixes.

Regards,

Tony
