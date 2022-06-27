Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF83855C14A
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 14:44:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbiF0Jwj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jun 2022 05:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233494AbiF0Jw2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jun 2022 05:52:28 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8E9D763FC
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 02:52:27 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id C356D8106;
        Mon, 27 Jun 2022 09:47:16 +0000 (UTC)
Date:   Mon, 27 Jun 2022 12:52:25 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Grazvydas Ignotas <notasas@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        alsa-devel@alsa-project.org, linux-omap@vger.kernel.org
Subject: Pandora audio using machine_is_omap3_pandora() check
Message-ID: <Yrl92RILZwhQOP+e@atomide.com>
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

Hi Grazvydas,

Arnd noticed that pandora audio is using machine_is_omap3_pandora() check
that never succeeds for devicetree booting machines. Looks like this has
been broken at some point many years ago with the devicetree conversion.

Does anybody have an interest in fixing this driver?

Regards,

Tony
