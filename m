Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 971D171FEB2
	for <lists+linux-omap@lfdr.de>; Fri,  2 Jun 2023 12:13:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235240AbjFBKNT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Jun 2023 06:13:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235219AbjFBKNN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 2 Jun 2023 06:13:13 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E6BEFE7
        for <linux-omap@vger.kernel.org>; Fri,  2 Jun 2023 03:13:12 -0700 (PDT)
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id A3D318111;
        Fri,  2 Jun 2023 10:13:11 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 1/3] Non-urgent driver fix for ti-sysc for v6.5
Date:   Fri,  2 Jun 2023 13:13:05 +0300
Message-ID: <pull-1685700720-242492@atomide.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v6.5/ti-sysc-signed

for you to fetch changes up to f620596fa347170852da499e778a5736d79a4b79:

  bus: ti-sysc: Fix dispc quirk masking bool variables (2023-05-17 10:17:01 +0300)

----------------------------------------------------------------
Non-urgent ti-sysc driver fix for v6.5 merge window

A fix for masking bool variables that can wait for the merge window
no problem.

----------------------------------------------------------------
Tony Lindgren (1):
      bus: ti-sysc: Fix dispc quirk masking bool variables

 drivers/bus/ti-sysc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
