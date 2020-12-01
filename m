Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 087562C982B
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 08:33:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgLAHcz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 02:32:55 -0500
Received: from muru.com ([72.249.23.125]:49616 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727937AbgLAHcy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 02:32:54 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 83B6A80A9;
        Tue,  1 Dec 2020 07:32:21 +0000 (UTC)
Date:   Tue, 1 Dec 2020 09:32:10 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Adam Ford <aford173@gmail.com>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: OMAP3: disable AES on N950/N9
Message-ID: <20201201073210.GU26857@atomide.com>
References: <20201129144710.25521-1-aaro.koskinen@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201129144710.25521-1-aaro.koskinen@iki.fi>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Aaro Koskinen <aaro.koskinen@iki.fi> [201129 16:47]:
> AES needs to be disabled on Nokia N950/N9 as well (HS devices), otherwise
> kernel fails to boot.

Thanks applying into fixes.

Tony
