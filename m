Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF81E709039
	for <lists+linux-omap@lfdr.de>; Fri, 19 May 2023 09:14:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbjESHOS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 May 2023 03:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjESHOR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 May 2023 03:14:17 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 92EE310E6;
        Fri, 19 May 2023 00:14:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B51CC80F9;
        Fri, 19 May 2023 07:14:00 +0000 (UTC)
Date:   Fri, 19 May 2023 10:13:59 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org
Subject: Mystery dtb check errors with ti,x-plate-ohms with txt only binding
Message-ID: <20230519071359.GW14287@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

Somehow the ti,x-plate-ohms property produces errors for nodes with the
compatible only in a txt binding that still uses /bits/ 16 value:

ti,x-plate-ohms: size (2) error for type uint32-array

For the yaml bindings, we have ti,xplate-ohms so far only defined in
Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml.

So for example, compatible = "ti,tsc2046" that only has a txt binding in
Documentation/devicetree/bindings/input/touchscreen/ads7846.txt still
produces warnings somehow based on the ti,tsc2005.yaml?

Any ideas why this is happening?

Regards,

Tony
