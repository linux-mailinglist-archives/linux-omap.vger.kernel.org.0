Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7454FF17A
	for <lists+linux-omap@lfdr.de>; Wed, 13 Apr 2022 10:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbiDMINO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Apr 2022 04:13:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbiDMINN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Apr 2022 04:13:13 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 133016384;
        Wed, 13 Apr 2022 01:10:53 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 2AF8680F5;
        Wed, 13 Apr 2022 08:08:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v4 0/2] Convert TI dmtimer binding to yaml
Date:   Wed, 13 Apr 2022 11:10:40 +0300
Message-Id: <20220413081042.27088-1-tony@atomide.com>
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

Hi,

Here's v4 changes for TI dmtimer changes. I kept Krzysztof's ack for
the second patch as the rebase on updated first patch was trivial.

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

Changes since v3:

- Simplify constraints for reg, clocks and clock-names as suggested by
  Krzysztof

- Use version number for patches too as suggested by Rob


Tony Lindgren (2):
  dt-bindings: timer: Update TI timer to yaml
  dt-bindings: timer: Add compatible for am6 for TI timer-dm

 .../bindings/pwm/pwm-omap-dmtimer.txt         |   2 +-
 .../bindings/timer/ti,timer-dm.yaml           | 158 ++++++++++++++++++
 .../devicetree/bindings/timer/ti,timer.txt    |  44 -----
 3 files changed, 159 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/ti,timer-dm.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,timer.txt

-- 
2.35.1
