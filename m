Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC7A4FE270
	for <lists+linux-omap@lfdr.de>; Tue, 12 Apr 2022 15:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356151AbiDLNZe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 09:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiDLNY6 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 09:24:58 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 436E01D2;
        Tue, 12 Apr 2022 06:17:00 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 881358061;
        Tue, 12 Apr 2022 13:14:24 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Keerthy <j-keerthy@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCHv3 0/2] Convert TI dmtimer binding to yaml
Date:   Tue, 12 Apr 2022 16:16:42 +0300
Message-Id: <20220412131644.59195-1-tony@atomide.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi all,

Here's v3 changes for TI dmtimer changes.

Regards,

Tony


Changes since v1:

- Improve yaml for various checks based on comments from Krzysztof
  and Nishanth

- Add checks for am4 timer as pointed out by Krzysztof and Rob

- Split am6 additions into a separate patch as suggested by Krzysztof

Changes since v2:

- Improve yaml for more checks based on comments from Grygorii and
  Krzysztof


Tony Lindgren (2):
  dt-bindings: timer: Update TI timer to yaml
  dt-bindings: timer: Add compatible for am6 for TI timer-dm

 .../bindings/pwm/pwm-omap-dmtimer.txt         |   2 +-
 .../bindings/timer/ti,timer-dm.yaml           | 171 ++++++++++++++++++
 .../devicetree/bindings/timer/ti,timer.txt    |  44 -----
 3 files changed, 172 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt

-- 
2.35.1
