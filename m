Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9192C98E7
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 09:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728419AbgLAIOj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 03:14:39 -0500
Received: from muru.com ([72.249.23.125]:49660 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727614AbgLAIOj (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 03:14:39 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 19A8980A9;
        Tue,  1 Dec 2020 08:14:05 +0000 (UTC)
Date:   Tue, 1 Dec 2020 10:13:55 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap3-gta04: fix twl4030-power settings
Message-ID: <20201201081355.GW26857@atomide.com>
References: <20201201074628.19628-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201201074628.19628-1-andreas@kemnade.info>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andreas Kemnade <andreas@kemnade.info> [201201 09:49]:
> Things are wired up for powersaving, so lets use the corresponding
> compatible and also update a deprecated property name.

Thanks applying into omap-for-v5.11/dt.

Tony
