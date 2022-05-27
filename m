Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E57C535EE0
	for <lists+linux-omap@lfdr.de>; Fri, 27 May 2022 13:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345174AbiE0LBv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 May 2022 07:01:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351234AbiE0LBp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 27 May 2022 07:01:45 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C26161312A9
        for <linux-omap@vger.kernel.org>; Fri, 27 May 2022 04:01:35 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id o80so7384886ybg.1
        for <linux-omap@vger.kernel.org>; Fri, 27 May 2022 04:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=8TFbb2M6sMMEwybb3zhPBuaczWAzFUWbj49acSTyIzw=;
        b=EovmO7wYlbIg0Y+/G7fdYxVFcC+Adh7u272KMAX+Hhn+Mwr/YBm7/w4IvF2Pid5ThX
         waWCDBk/7V1qHf4Y1ViVZ3tAzehyfRk1tBN+Qp8l5FWf4JZ/pOEKvMdpntbeFVJ7tE7C
         vcQHHolhiTVx3PLQDaons599FJyfxjtc441Z8loj2J2nRBZf7Mk8RFqeCFrydtULUH81
         2nv1MLaNjz16/78xE8Sp6miUHR7gcd3XiLuuAr4OgMDSPnv3YmPwOQGSN49ZKaCuLwXO
         n8wB8oG5v9Dlk5HJazLZAvP5S9KHvAg9vDYsgXUHGJ1hzkOL8QqkEB/eV9nXuorxZacZ
         g8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=8TFbb2M6sMMEwybb3zhPBuaczWAzFUWbj49acSTyIzw=;
        b=hqr1iyBTr5ckd5y2Q+xY4FASh7SZIE4sjP48ju/4IiceC8ztfrHn8yZa78YX6wiBT+
         euR7zcacp7YF6IO12DIV7pCSb9mOdDA4OF/9PZFhKkg5nnYCLIEIbzYUJQbl16e+XrWJ
         Pcl6jhMvGpNAnXL1w7DwMy0wKeBV5hxcvsZFSt19C6EqXPErU351Cein9rXZ2qBqdw0g
         a20asR3kgkqgYB38hzK4D72442sArTCmySQHazaBGuVpeC4fNOQR9N4jc2/nI8J2QD5Q
         g4G61C/Wvb3mldyI3cNMheIMSU6B1AurgaHz7BpiuEMQs7PvBwgVKZn8EATN63gzUTOI
         mPGA==
X-Gm-Message-State: AOAM532BW9phgBP/u7eT7YcLlvUShlXNSsl3qqFZkM1dQtS8mDw4n7Vl
        iyWAobGgSzxiTgyfbttBuZD4mlgE8QIfRSy05mlemj891XU=
X-Google-Smtp-Source: ABdhPJyzZStLjBzYds7yPkutaeVAtJ8rBqbT753OOLkmvF7FJbe4nONCc3Dsr7gpXprhurItlx1QxkzCZGBQLDPZGIc=
X-Received: by 2002:a25:1c84:0:b0:64f:6ecc:8fa7 with SMTP id
 c126-20020a251c84000000b0064f6ecc8fa7mr32377987ybc.432.1653649293441; Fri, 27
 May 2022 04:01:33 -0700 (PDT)
MIME-Version: 1.0
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Fri, 27 May 2022 13:01:23 +0200
Message-ID: <CAGm1_ku2O3Z7OegxKpq4SnaycvzmgFR7SO1PoZJ3h4P7OHvQYg@mail.gmail.com>
Subject: am335x: GPIOs in userspace
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I have the following problem. The latest kernel version I am using for
my devices is 5.4.x. In my DTS I don't explicitly expose the GPIOs to
the usespace but I can read input both via sysfs as also libgpiod API.

With the newest kernel like 5.17 or 5.18, I can read the same input
pin but I always read 0. I have also tried to add my GPIOs as
"default" into the am33xx_pinmux section (the way it is done in [1]) but
it didn't help.

[1] https://patchwork.kernel.org/project/linux-omap/patch/20200712103717.1219765-1-drew@beagleboard.org/

Regards,
Yegor
