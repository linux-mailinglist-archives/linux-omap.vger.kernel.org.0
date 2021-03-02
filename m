Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14C6932B152
	for <lists+linux-omap@lfdr.de>; Wed,  3 Mar 2021 04:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232105AbhCCApL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Mar 2021 19:45:11 -0500
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:59231 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1449295AbhCBQ1g (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Mar 2021 11:27:36 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id H7oZlNjwSOruFH7oklAWO9; Tue, 02 Mar 2021 17:24:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1614702254; bh=g4EqIicwlsCbluUsMLX/Juo9LDEWnCrvsgtLgDt/ZM8=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=gmfWZKXxuct/TEtQ+b/UxHaeImqgniSdszKj9DFEFz9ouzzAmU7S2LVtUJkc1kwLL
         Yf9AHFOgiEDhWr1xI84Ohcwzb32klIpYYRsZw3hjtSuXOgCYMMeXxHXjgF8MXQld2G
         rH0nuprxBdF/ZNv2sZWnhJRgoRy6ahOaxKmeEnynJ4O3qif+4yB4w/E4WsFcAgNrgV
         u9nzYcPPt5axjTrvVkJpEcChrRvOagarPoTRsolk3dSMarGy08bUH+8qXHni+Ch++L
         PCYdtY9DQIFXaJnDizV9Z7uqFtuxXNa7eJfBcZMz3n22L6xfJz45KonjB0/QmnHkDZ
         fllPQehCiokiw==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
        dri-devel@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCHv2 4/6] dt-bindings: display: ti: ti,omap5-dss.txt: add cec clock
Date:   Tue,  2 Mar 2021 17:24:01 +0100
Message-Id: <20210302162403.983585-5-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
References: <20210302162403.983585-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfC3izUHoGEhUuhakLv2+dkIjeIDtYHJO1pPfWD8nhP0CbF8pP8lcKrrDjdGvxaxHQng+R8j+ekxirIIpQGQ0/8Le44tj2HOvxPeBSA/oVA8c20A3KlJI
 qAwivk7ksrQFTk/ZGgDyWVboNo5Z3fy0f0Wcwgmrx1yeumIeRb9Ce3enmtGjOTVvYH9h3nnfjAzMEgPSXPOfVnMBMKXJaghj0zC1k/IgBSL57TXssDv7kADO
 x7B0m73iHBAZJmlGeQOYVeauXwHYL0oGnIShi+kdnpkD/dLpOSM0VKOLRXOT1cufIH8REhhe0Py/sC9HHl+q12wS5a07+4bNz1CSD25AhU5Ik3ebj2swsi7U
 xqEC/NeO80+yW2FWOFbj0vnkTPAUXH+BYT2UmY1t5qHG8s2S6w+QGwl+1008KMedN4h+Gu1Oc6M6nf1//gQvD6slMVqeQIJJonHCwaij0rcCr6SRQ43KDPBw
 1mYZXqz1cq+oZzKWp+p7gx5Mhhc80hGfiS0vJrua2C6Dy5XjG++fKgZ2bSw=
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The cec clock is required as well in order to support HDMI CEC,
document this.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
index 20861218649f..c321c67472f0 100644
--- a/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
+++ b/Documentation/devicetree/bindings/display/ti/ti,omap5-dss.txt
@@ -89,8 +89,8 @@ Required properties:
 - interrupts: the HDMI interrupt line
 - ti,hwmods: "dss_hdmi"
 - vdda-supply: vdda power supply
-- clocks: handles to fclk and pll clock
-- clock-names: "fck", "sys_clk"
+- clocks: handles to fclk, pll and cec clock
+- clock-names: "fck", "sys_clk", "cec"
 
 Optional nodes:
 - Video port for HDMI output
-- 
2.30.1

