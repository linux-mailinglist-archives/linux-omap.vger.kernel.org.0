Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD7D83477D6
	for <lists+linux-omap@lfdr.de>; Wed, 24 Mar 2021 13:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbhCXME1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 24 Mar 2021 08:04:27 -0400
Received: from muru.com ([72.249.23.125]:46516 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232207AbhCXMEN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 24 Mar 2021 08:04:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 64FCB8117;
        Wed, 24 Mar 2021 12:05:09 +0000 (UTC)
Date:   Wed, 24 Mar 2021 14:04:09 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     =?utf-8?B?QW5kcsOp?= Hentschel <nerv@dawncrow.de>
Cc:     robh+dt@kernel.org, bcousson@baylibre.com,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: omap3-echo: Update LED configuration
Message-ID: <YFsqueFbsegge1G/@atomide.com>
References: <20210130122514.58375-1-nerv@dawncrow.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210130122514.58375-1-nerv@dawncrow.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* André Hentschel <nerv@dawncrow.de> [210130 14:29]:
> Changes made in 54212f5a1ba3123281877e54c1e5f672bf7563d8 and previous commits broke with the way
> the LED drivers were described in device-trees before. These adjustments fix that.

Thanks applying both into omap-for-v5.13/dt.

Tony
