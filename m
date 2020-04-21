Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAD81B2D0B
	for <lists+linux-omap@lfdr.de>; Tue, 21 Apr 2020 18:46:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbgDUQqz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Apr 2020 12:46:55 -0400
Received: from muru.com ([72.249.23.125]:50656 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725963AbgDUQqz (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Apr 2020 12:46:55 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 737F68081;
        Tue, 21 Apr 2020 16:47:42 +0000 (UTC)
Date:   Tue, 21 Apr 2020 09:46:51 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am57xx-idk-common: add tc358778 bridge
Message-ID: <20200421164651.GY37466@atomide.com>
References: <20200417113020.23786-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417113020.23786-1-tomi.valkeinen@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200417 04:31]:
> AM5 IDK boards have TC358778 DPI-to-DSI bridge. Two different DSI panel
> models are used with the AM5 IDKs, and these panels are added with DT
> overlays. The AM5 IDKs can also be used without any panel.
> 
> Add TC358778 data to the am57xx-idk-common.dtsi, but set the status to
> disabled.

Thanks applying into omap-for-v5.8/dt.

Tony
