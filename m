Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 202907DABDA
	for <lists+linux-omap@lfdr.de>; Sun, 29 Oct 2023 10:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229486AbjJ2JM6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 Oct 2023 05:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjJ2JM5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 29 Oct 2023 05:12:57 -0400
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a02:c205:3004:2154::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62C5C9
        for <linux-omap@vger.kernel.org>; Sun, 29 Oct 2023 02:12:54 -0700 (PDT)
Received: from p200300ccff43670077eea60dad8e8305.dip0.t-ipconnect.de ([2003:cc:ff43:6700:77ee:a60d:ad8e:8305] helo=akair)
        by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <andreas@kemnade.info>)
        id 1qx1ql-005bfb-Pm
        for linux-omap@vger.kernel.org; Sun, 29 Oct 2023 10:12:51 +0100
Date:   Sun, 29 Oct 2023 10:12:49 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     linux-omap@vger.kernel.org
Subject: ti-sysc: probe of 4a318000.target-module failed with error -16
Message-ID: <20231029101249.2cc84607@akair>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

I am seeing the error message from $subject on omap4 devices regularly,
on omap4430-panda and on the epson bt200 (omap4460).
While not having the timer seems not critical in itself. I am wondering
whether something nasty is behind it which might cause more severe
problems.
Is this really seen everywhere?

Regards,
Andreas
