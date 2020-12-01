Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 251612C981F
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 08:26:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbgLAH0T (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 02:26:19 -0500
Received: from muru.com ([72.249.23.125]:49590 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727988AbgLAH0R (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 02:26:17 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4BAC880A9;
        Tue,  1 Dec 2020 07:25:44 +0000 (UTC)
Date:   Tue, 1 Dec 2020 09:25:33 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Sekhar Nori <nsekhar@ti.com>, linux-kernel@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/2] ARM: dts: am335x-evm/evmsk/icev2: switch to new cpsw
 switch drv
Message-ID: <20201201072533.GS26857@atomide.com>
References: <20201119154452.26961-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201119154452.26961-1-grygorii.strashko@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Grygorii Strashko <grygorii.strashko@ti.com> [201119 17:45]:
> Hi Tony,
> 
> This is the initial conversation of am335x boards to use new cpsw switch driver.
> This series adds the cpsw switch driver DT definition and am335x-evm/evmsk/icev2
> boards are converted to use it.

Thanks applying into omap-for-v5.11/dt.

Regards,

Tony
