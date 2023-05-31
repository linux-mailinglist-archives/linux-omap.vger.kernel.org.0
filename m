Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28FFE717610
	for <lists+linux-omap@lfdr.de>; Wed, 31 May 2023 07:21:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231942AbjEaFVU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 31 May 2023 01:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231805AbjEaFVT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 31 May 2023 01:21:19 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E840C11C;
        Tue, 30 May 2023 22:21:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 24E168164;
        Wed, 31 May 2023 05:21:18 +0000 (UTC)
Date:   Wed, 31 May 2023 08:21:16 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Alexander Shiyan <eagle.alexander923@gmail.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] ARM: dts: am335x-myirtech: Add missing NAND wait pin
 definition
Message-ID: <20230531052116.GT14287@atomide.com>
References: <20230524091157.775960-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524091157.775960-1-eagle.alexander923@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Alexander Shiyan <eagle.alexander923@gmail.com> [230524 12:12]:
> The NAND wait pin is connected to the GPMC, but this is not mentioned
> in the DT bindings. Let's fix this.

Thanks applying into omap-for-v6.5/dt.

Tony
