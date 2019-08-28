Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D44BEA0993
	for <lists+linux-omap@lfdr.de>; Wed, 28 Aug 2019 20:34:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfH1Se6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Aug 2019 14:34:58 -0400
Received: from muru.com ([72.249.23.125]:59010 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726567AbfH1Se6 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Aug 2019 14:34:58 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 3CD6681DD;
        Wed, 28 Aug 2019 18:35:27 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     soc@kernel.org
Cc:     arm@kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL 2/4] more ti-sysc driver changes for v5.4
Date:   Wed, 28 Aug 2019 11:34:50 -0700
Message-Id: <pull-1567016893-318461@atomide.com-2>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <pull-1567016893-318461@atomide.com>
References: <pull-1567016893-318461@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: "Tony Lindgren" <tony@atomide.com>

The following changes since commit c8a738f4cfaeccce40b171aca6da5fc45433ce60:

  bus: ti-sysc: remove set but not used variable 'quirks' (2019-08-13 04:40:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.4/ti-sysc-part2-signed

for you to fetch changes up to 7edd00f71f4b91ca31dbfa08926495fe5e77aab4:

  bus: ti-sysc: Detect d2d when debug is enabled (2019-08-26 08:33:25 -0700)

----------------------------------------------------------------
more ti-sysc driver changes for omap variants for v5.4

Few changes mostly to deal with sgx SoC glue quirk for omap36xx that
is needed for the related sgx SoC glue dts branch. The other changes
are to simplify sysc_check_one_child() sysc_check_children() to be void
functions, and detect d2d module when debugging is enabled.

----------------------------------------------------------------
Nishka Dasgupta (1):
      bus: ti-sysc: Change return types of functions

Tony Lindgren (2):
      bus: ti-sysc: Add module enable quirk for SGX on omap36xx
      bus: ti-sysc: Detect d2d when debug is enabled

 drivers/bus/ti-sysc.c                 | 45 ++++++++++++++++++++++-------------
 include/linux/platform_data/ti-sysc.h |  1 +
 2 files changed, 30 insertions(+), 16 deletions(-)
