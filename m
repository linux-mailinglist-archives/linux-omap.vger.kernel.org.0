Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A88AE1707C9
	for <lists+linux-omap@lfdr.de>; Wed, 26 Feb 2020 19:36:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726789AbgBZSgt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 13:36:49 -0500
Received: from muru.com ([72.249.23.125]:57848 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgBZSgs (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 13:36:48 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5B3598022;
        Wed, 26 Feb 2020 18:37:33 +0000 (UTC)
Date:   Wed, 26 Feb 2020 10:36:45 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: dra7: Add "dma-ranges" property to PCIe RC DT
 nodes
Message-ID: <20200226183645.GW37466@atomide.com>
References: <20200128064147.18276-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200128064147.18276-1-kishon@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Kishon Vijay Abraham I <kishon@ti.com> [200127 22:39]:
> 'dma-ranges' in a PCI bridge node does correctly set dma masks for PCI
> devices not described in the DT. Certain DRA7 platforms (e.g., DRA76)
> has RAM above 32-bit boundary (accessible with LPAE config) though the
> PCIe bridge will be able to access only 32-bits. Add 'dma-ranges'
> property in PCIe RC DT nodes to indicate the host bridge can access
> only 32 bits.

Sorry looks like I missed this fix earlier, applying into fixes.

Thanks,

Tony
