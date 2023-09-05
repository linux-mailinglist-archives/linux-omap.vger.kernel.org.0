Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4032B792473
	for <lists+linux-omap@lfdr.de>; Tue,  5 Sep 2023 17:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231232AbjIEP7A (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 5 Sep 2023 11:59:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354848AbjIEPCr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 5 Sep 2023 11:02:47 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E927D18D;
        Tue,  5 Sep 2023 08:02:43 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1c1f7f7151fso13006985ad.1;
        Tue, 05 Sep 2023 08:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693926163; x=1694530963; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NurAmI/o4Nt/FTksqJKmVIyAtt3h8f2QUxfQ9OayLBI=;
        b=GIi1KQth8ZxKAYpus1z2bOG5wqr++/N5M9Nsk9HZCbL4Gxmiuf0m+KhHMnuM1elg5w
         iQV/oQ21UYjVrP10ezCN8hUVncRwE9/0NgLvuscDOtytneLqj4Xj6PUE1Z+hIetGUtlA
         16bVKnvr6fBha+GnGqrNxivUpIZWkXwuQJ+j+ie08YNDhSyKlR8stp0YDWefSt+Izn87
         2ydZz3dbwjA36+Ml3C4BGfIut5mClMpGO0VR1IUiIbStCbs45ILmmyUirEiTs0bjAS/l
         r7cFacwyt0PWHQc1gsKces3Ddte+K5kXTS5c8za9kTBUBW1AxrNVJTrObXvE0GdblZS1
         scxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693926163; x=1694530963;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NurAmI/o4Nt/FTksqJKmVIyAtt3h8f2QUxfQ9OayLBI=;
        b=fGjyL01rePkHKhyGXrIhm1ypi2SbPPPrFnu+C022EdWP+GeHr8wRliX9F8z5iwh57i
         oojnF5DxCY4KBo+lYsj+lte71Q38GAuW2l9mpnghRPj7jykgFnlckLIoqzaiSZQkrTQ5
         TijvhNOgtEY4U6JW7q/26Mcc8157mL+d9GOZ4c/Q5GFR63O8VdAwq97U2aMFoEg2S5yq
         mZxjXmT55SSV6yYX9o6s89KpCzrmZvuKi6yMqq5t+sno0KOK9VyGeXLuuI/pGQ9auvKj
         j70UsQdrVmmzdqewdysXO/CFHMGbmcx+G32XyVlppzp33eWfzXoCKHNilrRm7nZEtsWe
         Sv0g==
X-Gm-Message-State: AOJu0YyvIO+9U0hMF9U/tge39xh/NPdtJZP6GFYuWX2fzQAKz6KVCaXC
        BIzrnM4GHZIE2Ek/ghjm+VhgkyXNZGL4DR/WGTXY7ChBOfI=
X-Google-Smtp-Source: AGHT+IGfE6p37dWMCRhNNFzvrFcn53nX6bxZBRLPS1JBPnx8zrNDJEBxkj1JJ9XsMTYzGQ6Gj4oevDz50W7zEqNuy8E=
X-Received: by 2002:a17:90a:bb97:b0:268:2543:723 with SMTP id
 v23-20020a17090abb9700b0026825430723mr10297064pjr.5.1693926162287; Tue, 05
 Sep 2023 08:02:42 -0700 (PDT)
MIME-Version: 1.0
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 5 Sep 2023 10:02:30 -0500
Message-ID: <CAHCN7xLQH8cksj8OxpvqAF_7uk_Gn-5+ROd7MfUo75EL580+iw@mail.gmail.com>
Subject: AM3517 Timer busy regression on 6.1.y branch
To:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Tony et al
,
I am trying to run the 6.1.y branch on an AM3517-EVM.

There are two GPT that throw an error:

 ti-sysc: probe of 48318000.target-module failed with error -16
 ti-sysc: probe of 49032000.target-module failed with error -16

I did some minor investigation and found sysc_check_active_timer() is
returning the busy condition.

I tracked this back a bit further and found that if I revert commit
a12315d6d270  ("bus: ti-sysc: Make omap3 gpt12 quirk handling SoC
specific"), this error condition goes away.

It almost looks to me like sysc_check_active_timer is defaulting to
-EBUSY when the SoC is not 3430, but the sysc_soc_match[] doesn't
appear to match to AM3517.

I think the proper solution is to treat the AM35* as 3430.  Do you
agree with that approach?

If so, I'll submit a patch with a fixes tag. I am also wondering how
far back I should mark the fixes tag.

adam
