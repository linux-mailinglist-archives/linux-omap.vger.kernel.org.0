Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB7B020E86F
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 00:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgF2WGx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 18:06:53 -0400
Received: from muru.com ([72.249.23.125]:59942 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726097AbgF2SfO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Jun 2020 14:35:14 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5603581B8;
        Mon, 29 Jun 2020 17:19:39 +0000 (UTC)
Date:   Mon, 29 Jun 2020 10:18:44 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Jason Kridner <jdk@ti.com>, Caleb Robey <c-robey@ti.com>,
        Drew Fustini <drew@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Enable IPU and DSP rprocs on AM5729 BeagleBone AI
Message-ID: <20200629171844.GX37466@atomide.com>
References: <20200611152945.27656-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200611152945.27656-1-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200611 08:30]:
> Hi Tony, Jason, Caleb,
> 
> The IPU and DSP remote processors are finally booting as of latest master
> on almost all the TI DRA7xx/AM57xx boards except for AM5729 BeagleBone AI
> board. We have most of the common dts pieces available due to the usage
> of common dra74-ipu-dsp.common.dtsi and dra7-ipu-dsp-common.dtsi files.
> The series leverages these to enable both the IPUs (IPU1 and IPU2) and
> DSPs (DSP1 and DSP2) on AM5729 BeagleBone AI board.

Thanks applying both into omap-for-v5.9/dt.

Tony
