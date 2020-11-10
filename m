Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461CF2AD743
	for <lists+linux-omap@lfdr.de>; Tue, 10 Nov 2020 14:15:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730345AbgKJNPe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Nov 2020 08:15:34 -0500
Received: from muru.com ([72.249.23.125]:47882 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgKJNPe (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 10 Nov 2020 08:15:34 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 1554180BA;
        Tue, 10 Nov 2020 13:15:38 +0000 (UTC)
Date:   Tue, 10 Nov 2020 15:15:29 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        letux-kernel@openphoenux.org, kernel@pyra-handheld.com
Subject: Re: [PATCH 0/2] AMR: DTS: fix and extension for Pandaboard ES
Message-ID: <20201110131529.GH26857@atomide.com>
References: <cover.1601734200.git.hns@goldelico.com>
 <0EB41455-D489-4F38-A8F7-C264BAE8D903@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0EB41455-D489-4F38-A8F7-C264BAE8D903@goldelico.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* H. Nikolaus Schaller <hns@goldelico.com> [201030 09:09]:
> ping
> 
> > Am 03.10.2020 um 16:09 schrieb H. Nikolaus Schaller <hns@goldelico.com>:
> > 
> > * fix wrong pinmux offset preventing the user button from working
> > * add uart connection for bluetooth wl1271 hci
> > 
> > H. Nikolaus Schaller (2):
> >  ARM: dts: pandaboard: fix pinmux for gpio user button of Pandaboard ES
> >  ARM: dts: pandaboard es: add bluetooth uart for HCI

Thanks applying both into omap-for-v5.11/dt.

Tony
