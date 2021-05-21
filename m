Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34EF38C342
	for <lists+linux-omap@lfdr.de>; Fri, 21 May 2021 11:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236574AbhEUJgt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 May 2021 05:36:49 -0400
Received: from muru.com ([72.249.23.125]:58436 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232672AbhEUJgs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 21 May 2021 05:36:48 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4C5A480C0;
        Fri, 21 May 2021 09:35:30 +0000 (UTC)
Date:   Fri, 21 May 2021 12:35:22 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2] ARM: dts: dra76-evm: remove ov5640
Message-ID: <YKd+2jehiTrw+L8R@atomide.com>
References: <20210423083712.74676-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423083712.74676-1-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [210423 11:38]:
> DRA76 EVM boards are not shipped with OV5640 sensor module, it is a
> separate purchase. OV5640 module is also just one of the possible
> sensors or capture boards you can connect.
> 
> However, for some reason, OV5640 has been added to the board dts file,
> making it cumbersome to use other sensors.
> 
> Remove the OV5640 from the dts file so that it is easy to use other
> sensors via DT overlays.

Adding into omap-for-v5.14/dt thanks.

Tony
