Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80E1B30468F
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 19:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388786AbhAZRWe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 12:22:34 -0500
Received: from muru.com ([72.249.23.125]:52922 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387449AbhAZHkb (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 Jan 2021 02:40:31 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 8454A814C;
        Tue, 26 Jan 2021 07:28:41 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Few ti-sysc changes for v5.12 merge window
Date:   Tue, 26 Jan 2021 09:28:32 +0200
Message-Id: <20210126072835.26551-1-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Here are few ti-sysc changes to mostly to have l4_wkup and l4_cfg
interconnects before l4_per interconnects.

Regards,

Tony

Tony Lindgren (3):
  bus: ti-sysc: Fix initializing module_pa for modules without sysc
    register
  bus: ti-sysc: Probe for l4_wkup and l4_cfg interconnect devices first
  bus: ti-sysc: Detect more modules for debugging

 drivers/bus/ti-sysc.c | 62 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 59 insertions(+), 3 deletions(-)

-- 
2.30.0
