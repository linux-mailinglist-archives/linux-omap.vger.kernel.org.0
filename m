Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F89065F3B5
	for <lists+linux-omap@lfdr.de>; Thu,  5 Jan 2023 19:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234420AbjAEScl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 5 Jan 2023 13:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234960AbjAESc1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 5 Jan 2023 13:32:27 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BB7059F95
        for <linux-omap@vger.kernel.org>; Thu,  5 Jan 2023 10:32:26 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id 6so23226918pfz.4
        for <linux-omap@vger.kernel.org>; Thu, 05 Jan 2023 10:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jcNTjIn8yMepi5RHdB32sWOgBUtukAwiSKGmmh6n+to=;
        b=LeP0sgoGj2vP9VciGwaAIZRbyqiHpwiQuNMm2H73uY1zqliuTJCliURo3gkmoNdz2e
         yTp27+QWkTxLxjgXz/h15oZ+dRB1ysbu3nB6D6XwL9VAIhyGf1gbdscFNiJA8yMwccng
         PTn8vZwZFGjZgLqxx4G97BuL1qPGaKndC+zZY8XujJKxTJlmIKoFz/r/yj36bLC0LhqV
         hAFtAPQ8LoqTYD7dJ186mb/cRgQ6IwYOjvDyXuTF9EmUVGpZT8BeNu92jtR0dAncw8BY
         vL/OVcSaoMlVzCiJopGUHLVrKsYU6imw0CLg6ijalQjaXSZCoLJzQq/hUgswDZ02DVI0
         tRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jcNTjIn8yMepi5RHdB32sWOgBUtukAwiSKGmmh6n+to=;
        b=E79n0h/vrhQAKu31LAN+prOPrNRAjz4dRvUSUkH/NhXdFfq1/LanXqzgJ5JdBs/nPI
         zv47+CpI8xyg0nDYqC71Zude096CpJz8jkospkxeDGEx3pmzMYj54tMtCAFse9vkX+11
         nFfyteSekCitKZaRzg46+Zs4equnvwhB3gQBe3/M63ASVF/j2QT3JjzxFtl2U8N7ylZ1
         /5I0wn6yhVEIPNf5/sXsKnstYAANlS10LBnCuzxNJZndylBrwYp8ydCo6pPLn3H+2peI
         X6G8HKjAER04GZpHFri+ohAc+R9W/hhVKwt+5SpSKhZsjhf5HRihopGwqLJkVG6rTXpG
         f+1Q==
X-Gm-Message-State: AFqh2krmUdXyLR31wp5HyM0lq8NnP35qcCHrX9k7u2tB4YQ9b38uQBAP
        vvJowAloMjh2UJhyzBG4KZ3VRm4SuVuOb2wUz9JQIl8V+kw=
X-Google-Smtp-Source: AMrXdXtiANgqqCbfta/hoO/VM6B7KoJA+ej6ST5RSsNmEGLI3kb5h0DZGvgBkPs7U3WZkpbb/MDDnXPbvlZurXa1IJ0=
X-Received: by 2002:aa7:973a:0:b0:580:e35e:f3f3 with SMTP id
 k26-20020aa7973a000000b00580e35ef3f3mr2205289pfg.53.1672943544803; Thu, 05
 Jan 2023 10:32:24 -0800 (PST)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Thu, 5 Jan 2023 12:32:13 -0600
Message-ID: <CAHCN7xKqRi+MXh97gzHM1RPo9ojBDGJABN0B0jZ6zPQYe1M=TA@mail.gmail.com>
Subject: AM3517 Failed to request pm_wkup irq
To:     Linux-OMAP <linux-omap@vger.kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

When booting the AM3517-EVM, I get a few errors related to the pm.

[    2.038452] pm: Failed to request pm_wkup irq
[    2.042846] omap2_common_pm_late_init: pm soc init failed: -22

omap3_pm_init inside pm34xx.c calls omap_prcm_event_to_irq looking for
"wkup" which returns EINVAL .

Inside omap_prm.c, there are a bunch of data structures for
omap_prm_data which contain for various boards for AM3, AM4, omap4,
omap5 and dra7, but a reference to ti,omap3-prm-inst appears to be
missing.  I looked at the TRM for the AM335X, and i can clearly see a
nice table with addresses that correspond to the tables found in
omap_prm.c, but after looking at both a DM3730 and AM3517 TRM, I am
not seeing a corresponding L4_WKUP Peripheral Memory map.

If someone can point me in the right direction, I can try to setup the
OMAP3 tables accordingly.

thanks

adam
