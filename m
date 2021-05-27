Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54EBF392DAA
	for <lists+linux-omap@lfdr.de>; Thu, 27 May 2021 14:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234834AbhE0MME (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 27 May 2021 08:12:04 -0400
Received: from muru.com ([72.249.23.125]:32842 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234799AbhE0MLy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 27 May 2021 08:11:54 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4194280A8;
        Thu, 27 May 2021 12:10:27 +0000 (UTC)
Date:   Thu, 27 May 2021 15:10:18 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: dra7-l4: Drop ti,omap4-uart entry from
 UART nodes
Message-ID: <YK+MKmK82f4IMWAW@atomide.com>
References: <20210526115956.3065-1-vigneshr@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210526115956.3065-1-vigneshr@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Vignesh Raghavendra <vigneshr@ti.com> [210526 15:00]:
> ti,omap4-uart was kept around to work with legacy omap-serial driver.
> Now that we have completed move to 8250-omap.c drop legacy compatible.
> This will simplify writing YAML schema.

Applying both into omap-for-v5.14/dt thanks.

Tony
