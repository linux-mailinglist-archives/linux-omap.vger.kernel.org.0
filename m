Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB1D19B84D
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2019 23:48:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393018AbfHWVrC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 23 Aug 2019 17:47:02 -0400
Received: from emh07.mail.saunalahti.fi ([62.142.5.117]:35770 "EHLO
        emh07.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392654AbfHWVrC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 23 Aug 2019 17:47:02 -0400
Received: from darkstar.musicnaut.iki.fi (85-76-87-181-nat.elisa-mobile.fi [85.76.87.181])
        by emh07.mail.saunalahti.fi (Postfix) with ESMTP id 15AB6B002B;
        Sat, 24 Aug 2019 00:47:00 +0300 (EEST)
Date:   Sat, 24 Aug 2019 00:46:55 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Tero Kristo <t-kristo@ti.com>, Tony Lindgren <tony@atomide.com>,
        Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc:     linux-omap@vger.kernel.org
Subject: OMAP3 ROM RNG probe failure on N900
Message-ID: <20190823214655.GH30291@darkstar.musicnaut.iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

I was looking at N900 boot logs from the current mainline (v5.3-rc),
and noticed this:

[    3.297668] omap3_rom_rng: initializing
[    3.301940] omap3_rom_rng: unable to get RNG clock
[    3.307006] omap3-rom-rng: probe of omap3-rom-rng failed with error -2

It seems some clock data was deleted with 0ed266d7ae5e ("clk: ti: omap3:
cleanup unnecessary clock aliases"), including one for omap3-rom-rng.
How this driver is supposed to work now? I guess it has been broken for
a while. :-(

A.
