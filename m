Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2FE8B78E
	for <lists+linux-omap@lfdr.de>; Tue, 13 Aug 2019 13:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfHMLug (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 13 Aug 2019 07:50:36 -0400
Received: from muru.com ([72.249.23.125]:57236 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726705AbfHMLug (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 13 Aug 2019 07:50:36 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 12DCC805C;
        Tue, 13 Aug 2019 11:51:02 +0000 (UTC)
Date:   Tue, 13 Aug 2019 04:50:32 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     David Lechner <david@lechnology.com>
Cc:     linux-omap@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: am335x-boneblue: Use of
 am335x-osd335x-common.dtsi
Message-ID: <20190813115032.GU52127@atomide.com>
References: <20190807200934.25173-1-david@lechnology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807200934.25173-1-david@lechnology.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* David Lechner <david@lechnology.com> [190807 13:10]:
> This makes use of the am335x-osd335x-common.dtsi file that contains the
> common device tree components for Octavo Systems AM335x System-in-
> Package that is used on the BeagleBone Blue.
> 
> This has two minor side-effects:
> 1. pinmux_i2c0_pins is renamed to pinmux-i2c0-pins
> 2. the 1000MHz cpufreq operating point is enabled

Applying into omap-for-v5.4/dt thanks.

Tony
