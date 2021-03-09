Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6E09332268
	for <lists+linux-omap@lfdr.de>; Tue,  9 Mar 2021 10:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbhCIJ55 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 9 Mar 2021 04:57:57 -0500
Received: from muru.com ([72.249.23.125]:41370 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229480AbhCIJ5m (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 9 Mar 2021 04:57:42 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 17CE9802C;
        Tue,  9 Mar 2021 09:58:22 +0000 (UTC)
Date:   Tue, 9 Mar 2021 11:57:37 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>, soc@kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH] ARM: omap1: fix building with clang IAS
Message-ID: <YEdGkZlCDdhKP6cw@atomide.com>
References: <20210308153430.2530616-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210308153430.2530616-1-arnd@kernel.org>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Arnd Bergmann <arnd@kernel.org> [210308 15:35]:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The clang integrated assembler fails to build one file with
> a complex asm instruction:
> 
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: error: invalid instruction, any one of the following would fix this:
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: armv6t2
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> arch/arm/mach-omap1/ams-delta-fiq-handler.S:249:2: note: instruction requires: thumb2
>  mov r10, #(1 << (((NR_IRQS_LEGACY + 12) - NR_IRQS_LEGACY) % 32)) @ set deferred_fiq bit
>  ^
> 
> The problem is that 'NR_IRQS_LEGACY' is not defined here. Apparently
> gas does not care because we first add and then subtract this number,
> leading to the immediate value to be the same regardless of the
> specific definition of NR_IRQS_LEGACY.
> 
> Neither the way that 'gas' just silently builds this file, nor the
> way that clang IAS makes nonsensical suggestions for how to fix it
> is great. Fortunately there is an easy fix, which is to #include
> the header that contains the definition.

Acked-by: Tony Lindgren <tony@atomide.com>
