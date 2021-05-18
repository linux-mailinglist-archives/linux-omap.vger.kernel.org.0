Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2297C387226
	for <lists+linux-omap@lfdr.de>; Tue, 18 May 2021 08:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239473AbhERGoL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 18 May 2021 02:44:11 -0400
Received: from muru.com ([72.249.23.125]:56996 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241635AbhERGoH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 18 May 2021 02:44:07 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id F1DCF80F5;
        Tue, 18 May 2021 06:42:52 +0000 (UTC)
Date:   Tue, 18 May 2021 09:42:45 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     aaro.koskinen@iki.fi, linux@armlinux.org.uk,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] usb: isp1301-omap: Add missing gpiod_add_lookup_table
 function
Message-ID: <YKNh5ekJ1ffBZ+xd@atomide.com>
References: <20210401162032.10150-1-maciej.falkowski9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401162032.10150-1-maciej.falkowski9@gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Maciej Falkowski <maciej.falkowski9@gmail.com> [210401 19:22]:
> The gpiod table was added without any usage making it unused
> as reported by Clang compilation from omap1_defconfig on linux-next:
> 
> arch/arm/mach-omap1/board-h2.c:347:34: warning: unused variable 'isp1301_gpiod_table' [-Wunused-variable]
> static struct gpiod_lookup_table isp1301_gpiod_table = {
>                                  ^
> 1 warning generated.
> 
> The patch adds the missing gpiod_add_lookup_table() function.

Applying into fixes thanks.

Tony
