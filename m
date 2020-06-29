Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97BF120DD5D
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jun 2020 23:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729471AbgF2SuM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 14:50:12 -0400
Received: from muru.com ([72.249.23.125]:59952 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729466AbgF2SuL (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 29 Jun 2020 14:50:11 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4C2E981BC;
        Mon, 29 Jun 2020 18:13:45 +0000 (UTC)
Date:   Mon, 29 Jun 2020 11:12:50 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     kernel test robot <lkp@intel.com>
Cc:     Adam Ford <aford173@gmail.com>, linux-omap@vger.kernel.org,
        kbuild-all@lists.01.org, aford@beaconembedded.com,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Walmsley <paul@pwsan.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: omap3: Migrate AES from hwmods to sysc-omap2
Message-ID: <20200629181250.GY37466@atomide.com>
References: <20200617105840.22138-1-aford173@gmail.com>
 <202006180107.6NIzI00f%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202006180107.6NIzI00f%lkp@intel.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* kernel test robot <lkp@intel.com> [200617 17:28]:
> Hi Adam,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on omap/for-next]
> [cannot apply to balbi-usb/testing/next]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

This applies to v5.8-rc1, so the error above can be ignored now.

Applying patch into omap-for-v5.9/ti-sysc-drop-pdata.

Thanks,

Tony
