Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D74BC146F64
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2020 18:17:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729297AbgAWRRl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 23 Jan 2020 12:17:41 -0500
Received: from muru.com ([72.249.23.125]:52124 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728731AbgAWRRl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 23 Jan 2020 12:17:41 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5F022810A;
        Thu, 23 Jan 2020 17:18:23 +0000 (UTC)
Date:   Thu, 23 Jan 2020 09:17:37 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v4 00/10] ARM: dts: dra7: add cal nodes
Message-ID: <20200123171737.GB5885@atomide.com>
References: <20191211140558.10407-1-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211140558.10407-1-bparrot@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191211 06:03]:
> This patch series adds the needed clkctrl and ty-sysc nodes for CAL module.
> It also adds support for the module in related dtsi and dts for DRA72,
> DRA76 and AM654 SoC.

Applying these into omap-for-v5.6/ti-sysc-dt-cam on top of Tero's
for-5.6-ti-clk branch. It might be too later for v5.6, but we'll
see.

Regards,

Tony
