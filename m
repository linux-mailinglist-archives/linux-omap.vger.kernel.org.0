Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4102F714412
	for <lists+linux-omap@lfdr.de>; Mon, 29 May 2023 08:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjE2GQl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 May 2023 02:16:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbjE2GQk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 May 2023 02:16:40 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BCD8CF
        for <linux-omap@vger.kernel.org>; Sun, 28 May 2023 23:16:15 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-bacbc7a2998so4347488276.3
        for <linux-omap@vger.kernel.org>; Sun, 28 May 2023 23:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685340968; x=1687932968;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=JPn8UIwEaPrCqkjozFOLV4NiP7RvPvX5dB0Wh4dCbju9d7e0lTJu6eSmWQ1lUrii9j
         IkBR5riIBFQILjz3tbrxETTzOqWE7//Pa2QyBGoQx3U7/utbkYEfxbwRHfPAWuY14am5
         OL+IL25hQo6CAMWGwSuuSN+0hqtbHd8eyModKQjMhcFjKWsTp59cRUYRLAAJcpv6Zfed
         cMPl6DtunC3BsggW5Gp7ZyMRS+rUYvPZFlEoTuMiAaEyx81k2rd1+tQK0usbX1K6dT2L
         xAwcbprTF9gRLqrr927TyBimarET3Ki09ETvTRhF14+wlQxW7RBlahXbOKjcrHrqsAF1
         SbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685340968; x=1687932968;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgsQjPYSA4x9EUAST26pLIMgzwk5/fmUNEDBBVE+P4A=;
        b=aCX7+EnQq3OjZdHUeZ3GX1cG99il/eSrSDePeCHZFf3kt/AAuYtaKmi968LhYyrBlU
         LaJZWJUquxEp9ARYQ3Ai0wtXibwpeED08yhviSSE6uG69nH5skM2KqlwSwehWiLA6jeX
         nprZl6jfqS8aFqGuZtyA/yqc2PpLOoJAO0xQ4BmWFfDbPgbEvDolutw9YaFEokBe8Vqp
         Kzb9TwubpOWioodga223LigWqJwcSCWsceVtjhWNJHmQx5ePbS+BOAJpvvoethWCljXJ
         qwS3W1FlEJf82LbtEKGbFf9e+urFugoyNW/A0emKxhAEMnbcKS/U7BR/ZXk4yj/5zKsM
         o2JA==
X-Gm-Message-State: AC+VfDxfYptN4cj2BeOGjcPRKbjOTmmVQOisLyAbDQBYnXgs3W7BQ4u+
        jvB1LDVLyAiFcAm1abHzmYMmCDH7Mtan97K9UWo=
X-Google-Smtp-Source: ACHHUZ5mER2Rzdz2RWP7zak3yY0eQnK0yqG8LbRLfpq+ciuwMKRNQdgcbF6LmTRnUnZfH1HDD+rlc8rVb6TIe6jouiw=
X-Received: by 2002:a25:4148:0:b0:ba8:1e01:ead5 with SMTP id
 o69-20020a254148000000b00ba81e01ead5mr9430746yba.60.1685340963536; Sun, 28
 May 2023 23:16:03 -0700 (PDT)
MIME-Version: 1.0
Sender: mrderick.smith2@gmail.com
Received: by 2002:a05:7108:5386:b0:30b:2a5b:30b0 with HTTP; Sun, 28 May 2023
 23:16:02 -0700 (PDT)
From:   Dr Lisa Williams <lw4666555@gmail.com>
Date:   Sun, 28 May 2023 23:16:02 -0700
X-Google-Sender-Auth: WmBFA3qCmfVyriCgQimHjX2virg
Message-ID: <CAO-9xdkGmDRhnyb2T0xHjfLF0efFvD28KsjZzXviF2ua5Hfw7Q@mail.gmail.com>
Subject: Hi,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

My name is Dr. Lisa Williams, from the United States, currently living
in the United Kingdom.

I hope you consider my friend request. I will share some of my photos
and more details about me when I get your reply.

With love
Lisa
