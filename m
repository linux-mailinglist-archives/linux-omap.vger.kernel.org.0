Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92A93166551
	for <lists+linux-omap@lfdr.de>; Thu, 20 Feb 2020 18:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728446AbgBTRvV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Feb 2020 12:51:21 -0500
Received: from muru.com ([72.249.23.125]:56398 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728119AbgBTRvV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 20 Feb 2020 12:51:21 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 67A268080;
        Thu, 20 Feb 2020 17:52:05 +0000 (UTC)
Date:   Thu, 20 Feb 2020 09:51:17 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     Dave Gerlach <d-gerlach@ti.com>, Roger Quadros <rogerq@ti.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: am437x-idk-evm: Fix incorrect OPP node names
Message-ID: <20200220175117.GN37466@atomide.com>
References: <20200210210423.22424-1-s-anna@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200210210423.22424-1-s-anna@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Suman Anna <s-anna@ti.com> [200210 13:05]:
> The commit 337c6c9a69af ("ARM: dts: am437x-idk-evm: Disable
> OPP50 for MPU") adjusts couple of OPP nodes defined in the
> common am4372.dtsi file, but used outdated node names. This
> results in these getting treated as new OPP nodes with missing
> properties.
> 
> Fix this properly by using the correct node names as updated in
> commit b9cb2ba71848 ("ARM: dts: Use - instead of @ for DT OPP
> entries for TI SoCs").

Applying into fixes thanks.

Tony
