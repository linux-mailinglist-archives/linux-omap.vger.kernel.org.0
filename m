Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 523BD517D4B
	for <lists+linux-omap@lfdr.de>; Tue,  3 May 2022 08:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbiECGao (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 May 2022 02:30:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiECGao (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 May 2022 02:30:44 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4A0DBB05;
        Mon,  2 May 2022 23:27:13 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id D9B3380FB;
        Tue,  3 May 2022 06:23:56 +0000 (UTC)
Date:   Tue, 3 May 2022 09:27:11 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Alexander Shiyan <eagle.alexander923@gmail.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 1/2] ARM: dts: am335x-myirtech: Add an external clock
 oscillator for CPU RTC
Message-ID: <YnDLP3yw973/D7cw@atomide.com>
References: <20220427081914.6773-1-eagle.alexander923@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427081914.6773-1-eagle.alexander923@gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Alexander Shiyan <eagle.alexander923@gmail.com> [220427 11:16]:
> The CPU RTC has an external crystal, so to keep time, let's define
> it for devicetree.

I've applied both patches into omap-for-v5.19/dt thanks.

Tony
