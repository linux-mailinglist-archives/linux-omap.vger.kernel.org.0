Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83EB94D1A8C
	for <lists+linux-omap@lfdr.de>; Tue,  8 Mar 2022 15:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235886AbiCHO3o (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Mar 2022 09:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240510AbiCHO3m (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Mar 2022 09:29:42 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C250205C3
        for <linux-omap@vger.kernel.org>; Tue,  8 Mar 2022 06:28:45 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id e24so15842758wrc.10
        for <linux-omap@vger.kernel.org>; Tue, 08 Mar 2022 06:28:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=+xCzDXKpurcBEhZ8+xr/1+qLsXYFBobYcsOzCn7TcBU=;
        b=qVkxwgK1b+28wfo7AE+m0D/9E55CAaNHjVfggvzz4y1jrFEcqF+CAdv7IM+KHyJAsy
         kWCN5Ez/mP7h9h6bpxp6/TAEaV328gRxK778qVwrRxvxR4tr/l1RPCTDR82iQTPn5Wax
         TuZA87kQltJfQLsmP6fuZKQ4pIZQdhPxY8QrrnSjm8fSJ2AHt2tzEL1IA3nq4God2ic6
         tPmcjhh+nE10IgFYtUr+FVpp8W0kskWdPNSjKh3Oe6HsfmAo/TeQKi+EB4jfdFsCBF0e
         TEurA9G1+D3aT7wDN9rqiSJk5jriFub1oW7GvWnCc4W5i0HJjijUpIjbRko/xul1waJf
         G8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=+xCzDXKpurcBEhZ8+xr/1+qLsXYFBobYcsOzCn7TcBU=;
        b=aBwp7HXr2sxndrzeoAwH8LtR1Qvd52DZZXfjT2Ee4+bAl8dthIokhLxUmQvZWViSpD
         GUap7RL5WRrduNv3ZgFgbdfT8CsIQW/7MM0RGOQMFLN680wDnJqxRj9bA+pPBRx/jntQ
         Reo4od4bmn6eoVL3Vq3g+r/fN6mOjAbK6MIrIqIaZs/Pd7tRoD+w1UwoqIW0pACEERLl
         UMiyv2N5CgSrdYb8mxyRjy5RzVrhflvYDJyHIqWoICQrowHtiZFCvEq4eZK1vatstiQ3
         Gn3E5oHA/afumZz8d/3KOkCVgoLP2j/U8XWmJXol5ZVEukmOe0MOcom/p4Wyu6P0s1qf
         jxJA==
X-Gm-Message-State: AOAM530ox+mIiD+0gyfh8Zci4Humhpv2Ogp8RojQUtu8COX7+tsz1nNx
        nBA2OCBtT8+ozZCIJrx6M/JIkE4wJ0jmoEbZi8k=
X-Google-Smtp-Source: ABdhPJyN362TV5q1ThoYoFsjE56SEqE3pAvo+m8K0LdM8BraKLObiWoLsRgnZNl8B6Cr2p9ZNZLFOSA4UBHJcsFsV94=
X-Received: by 2002:adf:eb86:0:b0:1e6:8c92:af6b with SMTP id
 t6-20020adfeb86000000b001e68c92af6bmr12495967wrn.116.1646749723258; Tue, 08
 Mar 2022 06:28:43 -0800 (PST)
MIME-Version: 1.0
Sender: abiodunboluwatife2017@gmail.com
Received: by 2002:a05:600c:502c:0:0:0:0 with HTTP; Tue, 8 Mar 2022 06:28:41
 -0800 (PST)
From:   Lisa Williams <lw23675851@gmail.com>
Date:   Tue, 8 Mar 2022 14:28:41 +0000
X-Google-Sender-Auth: V9xPcfHWoWwaPZchQ2Y842fPtP0
Message-ID: <CADqw2PJ6dps8sfkNJTY6MXZohie2=6P_cMwuASuV1SNoGXNDuw@mail.gmail.com>
Subject: My name is Lisa Williams
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Dear,

My name is Lisa  Williams, I am from the United States of America, Its
my pleasure to contact you for new and special friendship, I will be
glad to see your reply for us to know each other better.

Yours
Lisa
