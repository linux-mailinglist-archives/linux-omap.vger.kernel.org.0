Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14756246554
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 13:27:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgHQL11 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 07:27:27 -0400
Received: from muru.com ([72.249.23.125]:40542 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbgHQL1Z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Aug 2020 07:27:25 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5C48780A3;
        Mon, 17 Aug 2020 11:27:24 +0000 (UTC)
Date:   Mon, 17 Aug 2020 14:27:51 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: logicpd-som-lv-baseboard: Fix missing video
Message-ID: <20200817112751.GH2994@atomide.com>
References: <20200814122441.2425966-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200814122441.2425966-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [200814 15:24]:
> A previous commit removed the panel-dpi driver, which made the
> SOM-LV video stop working because it relied on the DPI driver
> for setting video timings.  Now that the simple-panel driver is
> available in omap2plus, this patch migrates the SOM-LV dev kits
> to use a similar panel and remove the manual timing requirements.
> A similar patch was already done and applied to the Torpedo family.

Thanks applying into fixes.

Tony
