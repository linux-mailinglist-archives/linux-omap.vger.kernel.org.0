Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68C50146DDE
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2020 17:09:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728913AbgAWQJk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jan 2020 11:09:40 -0500
Received: from muru.com ([72.249.23.125]:52066 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726231AbgAWQJj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Jan 2020 11:09:39 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 78B4C810A;
        Thu, 23 Jan 2020 16:10:21 +0000 (UTC)
Date:   Thu, 23 Jan 2020 08:09:35 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 15/20] ARM: omap2plus: Drop unneeded select of
 MIGHT_HAVE_CACHE_L2X0
Message-ID: <20200123160935.GY5885@atomide.com>
References: <20200121103413.1337-1-geert+renesas@glider.be>
 <20200121103722.1781-1-geert+renesas@glider.be>
 <20200121103722.1781-15-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200121103722.1781-15-geert+renesas@glider.be>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Geert Uytterhoeven <geert+renesas@glider.be> [200121 10:38]:
> Support for TI AM43x SoCs depends on ARCH_MULTI_V7, which selects
> ARCH_MULTI_V6_V7.
> As the latter selects MIGHT_HAVE_CACHE_L2X0, there is no need for
> SOC_AM43XX to select MIGHT_HAVE_CACHE_L2X0.

Acked-by: Tony Lindgren <tony@atomide.com>
