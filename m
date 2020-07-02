Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 607E9212820
	for <lists+linux-omap@lfdr.de>; Thu,  2 Jul 2020 17:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgGBPlB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Jul 2020 11:41:01 -0400
Received: from muru.com ([72.249.23.125]:60280 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgGBPlA (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Jul 2020 11:41:00 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EE4FF8062;
        Thu,  2 Jul 2020 15:41:51 +0000 (UTC)
Date:   Thu, 2 Jul 2020 08:40:55 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     kernel test robot <lkp@intel.com>
Cc:     linux-omap@vger.kernel.org, kbuild-all@lists.01.org,
        clang-built-linux@googlegroups.com,
        "Andrew F . Davis" <afd@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/6] soc: ti: omap-prm: Configure sgx power domain for
 am3 and am4
Message-ID: <20200702154055.GJ37466@atomide.com>
References: <20200622164652.12054-4-tony@atomide.com>
 <202006300345.RrpFuQqi%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202006300345.RrpFuQqi%lkp@intel.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* kernel test robot <lkp@intel.com> [200629 19:24]:
> >> drivers/soc/ti/omap_prm.c:98:21: warning: attribute declaration must precede definition [-Wignored-attributes]
>    static const struct __maybe_unused omap_prm_domain_map omap_prm_noinact = {

Thanks no more need for __maybe_unused with these patches actually,
so I'll just drop those from the series.

Regards,

Tony
