Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8022F9442
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2019 16:29:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726977AbfKLP3x (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Nov 2019 10:29:53 -0500
Received: from muru.com ([72.249.23.125]:41820 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726376AbfKLP3w (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 12 Nov 2019 10:29:52 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D223080F3;
        Tue, 12 Nov 2019 15:30:28 +0000 (UTC)
Date:   Tue, 12 Nov 2019 07:29:49 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Benoit Parrot <bparrot@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [Patch v3 02/10] ARM: dts: dra7: add cam clkctrl node
Message-ID: <20191112152949.GF5610@atomide.com>
References: <20191112142753.22976-1-bparrot@ti.com>
 <20191112142753.22976-3-bparrot@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191112142753.22976-3-bparrot@ti.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Benoit Parrot <bparrot@ti.com> [191112 14:25]:
> Add clkctrl nodes for CAM domain.
> 
> Note that because of the current dts node name dependency for mapping to
> clock domain, we must still use "cam-clkctrl@" naming instead of generic
> "clock@" naming for the node. And because of this, it's probably best to
> apply the dts node addition together along with the other clock changes.

Thanks for updating this too.

Tero, for merging, you could create a separate clock dts changes branch
too on your clock changes if needed, up to you. Anyways best that you
queue all the clock changes and clock related dts changes:

Acked-by: Tony Lindgren <tony@atomide.com>
