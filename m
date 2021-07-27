Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C5B43D70FB
	for <lists+linux-omap@lfdr.de>; Tue, 27 Jul 2021 10:15:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235845AbhG0IPf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Jul 2021 04:15:35 -0400
Received: from muru.com ([72.249.23.125]:55584 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235740AbhG0IPe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Jul 2021 04:15:34 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 7950080F0;
        Tue, 27 Jul 2021 08:15:51 +0000 (UTC)
Date:   Tue, 27 Jul 2021 11:15:32 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Graeme Gregory <gg@slimlogic.co.uk>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Nishanth Menon <nm@ti.com>,
        peter.ujfalusi@gmail.com,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] omap5-board-common: remove not physically existing
 vdds_1v8_main fixed-regulator
Message-ID: <YP/ApEN0lJB6m0GX@atomide.com>
References: <e836d5d98b028bdbb8805bcf79489e0df28add6c.1625148021.git.hns@goldelico.com>
 <27948BF2-82E3-4140-A194-F938F3A64863@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27948BF2-82E3-4140-A194-F938F3A64863@goldelico.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [210714 07:33]:
> Any comments?

Seems like the way to go, applying into fixes.

Thanks,

Tony
