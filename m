Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A6142535D
	for <lists+linux-omap@lfdr.de>; Thu,  7 Oct 2021 14:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241194AbhJGMvA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 Oct 2021 08:51:00 -0400
Received: from muru.com ([72.249.23.125]:41842 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233158AbhJGMu7 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 Oct 2021 08:50:59 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id D715180C7;
        Thu,  7 Oct 2021 12:49:34 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>,
        Suman Anna <s-anna@ti.com>
Subject: [PATCH 0/3] Updates for simple-pm-bus and ti-sysc bindings
Date:   Thu,  7 Oct 2021 15:48:55 +0300
Message-Id: <20211007124858.44011-1-tony@atomide.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Turns out we added a bunch of new devicetree warnings for omaps when we
updated the dts files to use simple-pm-bus. Here are the binding changes
to fix most of the introduced simple-pm-bus related warnings.

I'll post the dts changes separately as we have ranges missing for some
interconnect segments, and can also now rename the ocp node.

Regards,

Tony


Tony Lindgren (3):
  dt-bindings: bus: simple-pm-bus: Make clocks and power-domains
    optional
  dt-bindings: bus: simple-pm-bus: Add more matches for node name
  dt-bindings: bus: ti-sysc: Update to use yaml binding

 .../bindings/bus/simple-pm-bus.yaml           |  19 +--
 .../devicetree/bindings/bus/ti-sysc.txt       | 139 ----------------
 .../devicetree/bindings/bus/ti-sysc.yaml      | 150 ++++++++++++++++++
 3 files changed, 156 insertions(+), 152 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/bus/ti-sysc.txt
 create mode 100644 Documentation/devicetree/bindings/bus/ti-sysc.yaml

-- 
2.33.0
