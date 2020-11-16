Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8A4D2B4305
	for <lists+linux-omap@lfdr.de>; Mon, 16 Nov 2020 12:39:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbgKPLi7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Nov 2020 06:38:59 -0500
Received: from muru.com ([72.249.23.125]:48578 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728352AbgKPLi7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Nov 2020 06:38:59 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1838280C8;
        Mon, 16 Nov 2020 11:39:04 +0000 (UTC)
Date:   Mon, 16 Nov 2020 13:38:55 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Alexander Shiyan <shc_work@mail.ru>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] ARM: dts: am335x: Fix comments for AM335X_PIN_GPMC_WPN
 pin in GPIO mode
Message-ID: <20201116113855.GF26857@atomide.com>
References: <20201111155910.13728-1-shc_work@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111155910.13728-1-shc_work@mail.ru>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Alexander Shiyan <shc_work@mail.ru> [201111 17:59]:
> According to AM335x datasheet pin AM335X_PIN_GPMC_WPN in MODE7 works as
> GPIO0[31].

Thanks applying into omap-for-v5.11/dt.

Tony
