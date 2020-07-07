Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A31892175B5
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 19:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728459AbgGGR5F (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 13:57:05 -0400
Received: from muru.com ([72.249.23.125]:32770 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728073AbgGGR5F (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 13:57:05 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 2BD7F80FB;
        Tue,  7 Jul 2020 17:57:56 +0000 (UTC)
Date:   Tue, 7 Jul 2020 10:56:55 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Johnson CH Chen =?utf-8?B?KOmZs+aYreWLsyk=?= 
        <JohnsonCH.Chen@moxa.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] ARM: dts: am335x: add support for Moxa UC-8100A-ME
 open platform
Message-ID: <20200707175655.GA5849@atomide.com>
References: <HK2PR01MB328129CEA1A9294A8715CE28FA660@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK2PR01MB328129CEA1A9294A8715CE28FA660@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Johnson CH Chen (陳昭勳) <JohnsonCH.Chen@moxa.com> [200707 03:24]:
> UC-8100A-ME is advanced of UC-8100-ME-T, and UC-8100-ME-T is deprecated.
> 
> UC-8100A-ME provides larger RAM and eMMC, better input current than
> UC-8100-ME-T's, and it supports selectable LTE module for US/EU/APAC.

So what about the existing users of UC-8100-ME-T?

To me it seems you should just add am335x-moxa-uc-8100-common.dtsi
or similar. And then have minimal dts files for each model. That way
you can easily keep the support UC-8100-ME-T around.

Regards,

Tony
