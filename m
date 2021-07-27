Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 096433D70BB
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 10:00:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235746AbhG0IAi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 04:00:38 -0400
Received: from muru.com ([72.249.23.125]:55516 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235675AbhG0IAh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 04:00:37 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5691780F0;
        Tue, 27 Jul 2021 08:00:54 +0000 (UTC)
Date:   Tue, 27 Jul 2021 11:00:35 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Kevin Hilman <khilman@baylibre.com>
Cc:     linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dave Gerlach <d-gerlach@ti.com>
Subject: Re: [PATCH] ARM: dts: am43x-epos-evm: Reduce i2c0 bus speed for
 tps65218
Message-ID: <YP+87A0TSkpFGkI/@atomide.com>
References: <20210716160730.30547-1-khilman@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210716160730.30547-1-khilman@baylibre.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Kevin Hilman <khilman@baylibre.com> [210716 19:07]:
> From: Dave Gerlach <d-gerlach@ti.com>
> Without this patch occasionally a voltage set operation from the kernel
> will appear to have worked but the actual voltage reflected on the PMIC
> will not have updated, causing problems especially with cpufreq that may
> update to a higher OPP without actually raising the voltage on DCDC2,
> leading to a hang.

Applying into fixes thanks.

Tony
