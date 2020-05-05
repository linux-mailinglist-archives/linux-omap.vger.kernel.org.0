Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A74E61C6059
	for <lists+linux-omap@lfdr.de>; Tue,  5 May 2020 20:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728609AbgEESm0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 May 2020 14:42:26 -0400
Received: from muru.com ([72.249.23.125]:52962 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728135AbgEESm0 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 5 May 2020 14:42:26 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 9F00B80A5;
        Tue,  5 May 2020 18:43:14 +0000 (UTC)
Date:   Tue, 5 May 2020 11:42:23 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     linux-omap@vger.kernel.org, aford@beaconembedded.com,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: omap3: Migrate AES from hwmods to sysc-omap2
Message-ID: <20200505184223.GR37466@atomide.com>
References: <20200504230100.181926-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200504230100.181926-1-aford173@gmail.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [200504 16:02]:
> Various OMAP3 boards have two AES blocks, but only one is currently
> available, because the hwmods are only configured for one.
> 
> This patch migrates the hwmods for the AES engine to sysc-omap2
> which allows the second AES crypto engine to become available.
> 
>   omap-aes 480a6000.aes1: OMAP AES hw accel rev: 2.6
>   omap-aes 480a6000.aes1: will run requests pump with realtime priority
>   omap-aes 480c5000.aes2: OMAP AES hw accel rev: 2.6
>   omap-aes 480c5000.aes2: will run requests pump with realtime priority

Great :) Looks like I'm getting the following though:

DTC     arch/arm/boot/dts/am3517-craneboard.dtb
arch/arm/boot/dts/omap3.dtsi:160.39-184.5: ERROR (phandle_references):
/ocp@68000000/target-module@480a6000:
Reference to non-existent node or label "aes1_ick"

Is this patch maybe missing a change for am3717 for the aes1_ick?

Regards,

Tony
